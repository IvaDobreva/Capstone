from flask import Flask
from flask import request
from flask_cors import CORS
from flaskext.mysql import MySQL
import requests
import sys
import json

import io
import os

# Imports the Google Cloud client library
from google.cloud import vision
from google.cloud.vision import types

app = Flask(__name__)
CORS(app)

mysql = MySQL()
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'password'
app.config['MYSQL_DATABASE_DB'] = 'capstone'
app.config['MYSQL_DATABASE_CHARSET'] = 'utf8mb4'
mysql.init_app(app)

conn = mysql.connect()
cursor = conn.cursor()

@app.route('/')
def img_download():
    GET_VOCAB = "SELECT kor_word, eng_word, processed FROM vocabulary;"
    MARK_VOCAB = "UPDATE vocabulary SET processed = 1 WHERE kor_word = %s;"
    INSERT_IMAGE = "INSERT INTO image (imgname) VALUES (%s);"
    #get word form DB
    cursor.execute(GET_VOCAB)
    records = cursor.fetchall()

    #execute custom search with google search api
    for record in records:
        if(record[2] == 0):
            params = {'key':'AIzaSyC4lzrt7WjTncucg0-r5yccKuqyYns1qjo', 'cx':'012017168918701040843:itxhwhoxuss', 'q':record[0], 'searchType':'image', 'num':1}
            response = requests.get('https://www.googleapis.com/customsearch/v1', params=params)

            #save the image locally and update DB (image table)
            image_url = response.json()['items'][0]['link']
            image_name = record[1]

            img_data = requests.get(image_url).content
            cursor.execute( INSERT_IMAGE, image_name)
            conn.commit()
            with open('./public/images/'+image_name, 'wb') as handler:
                handler.write(img_data)
                print("Downloading and saving image file for " + image_name)


            #mark the word as processed
            cursor.execute(MARK_VOCAB, record[0])
            conn.commit()
    return "Download Complete"


@app.route('/label')
def label_img():
    GET_ALL_IMG = "SELECT imgname FROM image;"
    UPDATE_LABELS = "UPDATE image SET labels=\"%s\" WHERE imgname='%s';"
    cursor.execute(GET_ALL_IMG)
    result = cursor.fetchall()
    # Instantiates a client
    client = vision.ImageAnnotatorClient()

    # The name of the image file to annotate
    for img in result:
        file_name = os.path.join(
            os.path.dirname(__file__),
            'public/images/', img[0])

        # Loads the image into memory
        with io.open(file_name, 'rb') as image_file:
            content = image_file.read()

        image = types.Image(content=content)

        # Performs label detection on the image file
        response = client.label_detection(image=image)
        labels = response.label_annotations

        label_list = []
        print('Labels:')
        for label in labels:
            label_list.append(label.description)
            print(label.description)

        cursor.execute(UPDATE_LABELS % (','.join(label_list), img[0]))
        conn.commit()
    return str(label_list)

@app.route('/linkimage', methods=['POST'])
def linkimage():
    IF_EXIST = "SELECT kor_word, eng_word FROM vocabulary WHERE  eng_word='%s';"

    if request.method == 'POST':
     kor = request.form.get('kor')
     eng = request.form.get('eng')

     #check if the word exists in the table
     query = IF_EXIST % ( eng)

     cursor.execute(query)
     result = cursor.fetchall()

     print(result)
     if len(result) != 0:
         for res in result:
             print(res[0] == kor)
             if res[0].encode('utf-8') == kor.encode('utf-8'):
                 return "existing"


     params = {'key':'AIzaSyC4lzrt7WjTncucg0-r5yccKuqyYns1qjo', 'cx':'012017168918701040843:itxhwhoxuss', 'q':eng, 'searchType':'image', 'num':9}
     response = requests.get('https://www.googleapis.com/customsearch/v1', params=params)

     #save the image locally and update DB (image table)
     image_url = []
     image = response.json()['items']#[0]['link']
     for i in image:
         image_url.append(str(i['link']))

    return str(image_url)

@app.route('/linkimage/label', methods=['POST'])
def label():
    ADD_VOCAB = "INSERT INTO vocabulary(kor_word, eng_word) VALUES (%s, %s);"
    MARK_VOCAB = "UPDATE vocabulary SET processed = 1 WHERE kor_word = %s;"
    INSERT_IMAGE = "INSERT INTO image (imgname) VALUES (%s);"
    UPDATE_LABELS = "UPDATE image SET labels=\"%s\" WHERE imgname='%s';"
    GET_DIC = "SELECT kor_word, eng_word FROM vocabulary;"
    INSERT_KOR_LABEL = "INSERT INTO kor_labels(imgID, labelsKR) VALUES('%d', '%s');"
    GET_IMG_ID = "SELECT id FROM image WHERE imgname = '%s';"

    eng = request.form.get('eng')
    kor = request.form.get('kor')
    url = request.form.get('url')
    image_name = request.form.get('eng')
    if request.method == 'POST':
        img_data = requests.get(url).content
        cursor.execute( INSERT_IMAGE, image_name)
        conn.commit()
        with open('./public/images/'+image_name, 'wb') as handler:
            handler.write(img_data)
            print("Downloading and saving image file for " + image_name)

        #insert new word in vocabulary db
        cursor.execute(ADD_VOCAB, (kor, eng))
        conn.commit()

        #mark the word as processed
        cursor.execute(MARK_VOCAB, kor)
        conn.commit()

        # Instantiates a client
        client = vision.ImageAnnotatorClient()

        # The name of the image file to annotate
        file_name = os.path.join(os.path.dirname(__file__), 'public/images/', image_name)

        # Loads the image into memory
        with io.open(file_name, 'rb') as image_file:
            content = image_file.read()
            image = types.Image(content=content)

        # Performs label detection on the image file
        response = client.label_detection(image=image)
        labels = response.label_annotations

        #Get kor+eng translations from vocab
        cursor.execute(GET_DIC)
        dic_data = cursor.fetchall()

        dict = {}
        for word in dic_data:
            dict[word[1]] = word[0]

        label_list = []
        label_lst_kr = []
        for label in labels:
            label_list.append(label.description)
            try:
                label_lst_kr.append(dict[label.description.lower()])
            except Exception as e:
                print(e)
        cursor.execute(UPDATE_LABELS % (','.join(label_list), image_name))
        conn.commit()

        cursor.execute(GET_IMG_ID % image_name)
        img_id = cursor.fetchall()
        print(img_id[len(img_id)-1][0])
        cursor.execute(INSERT_KOR_LABEL % (img_id[len(img_id)-1][0], ','.join(label_lst_kr)))
        conn.commit()
    return "done"

@app.route('/extokor')
def existingToKor():
    GET_ALL_IMG = "SELECT * FROM image;"
    GET_DIC = "SELECT kor_word, eng_word FROM vocabulary;"
    INSERT_KOR_LABEL = "INSERT INTO kor_labels(imgID, labelsKR) VALUES('%d', '%s');"

    #Get all images+labelsENG
    cursor.execute( GET_ALL_IMG)
    img_data = cursor.fetchall()

    #Get kor+eng translations from vocab
    cursor.execute(GET_DIC)
    dic_data = cursor.fetchall()

    dict = {}
    for word in dic_data:
        dict[word[1]] = word[0]

    for record in img_data:
        kor_labels = []
        for label in record[2].split(','):
            try:
                kor_labels.append(dict[label.lower()])
            except Exception as e:
                print(e)
        cursor.execute(INSERT_KOR_LABEL % (record[0], ','.join(kor_labels)))
        conn.commit()

    return "done"

if __name__ == "__main__":
    app.run(port=3001, debug=True)
