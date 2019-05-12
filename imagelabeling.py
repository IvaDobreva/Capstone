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
    if request.method == 'POST':
     kor = request.form.get('kor')
     eng = request.form.get('eng')

     params = {'key':'AIzaSyC4lzrt7WjTncucg0-r5yccKuqyYns1qjo', 'cx':'012017168918701040843:itxhwhoxuss', 'q':kor, 'searchType':'image', 'num':10}
     response = requests.get('https://www.googleapis.com/customsearch/v1', params=params)

     #save the image locally and update DB (image table)
     image_url = []
     image = response.json()['items']#[0]['link']
     for i in image:
         image_url.append(i['link'])
         print(i['link'])

    return str(image_url)

if __name__ == "__main__":
    app.run(port=3001, debug=True)
