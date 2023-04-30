from flask import Flask, request, jsonify
import cv2
from model import test
import numpy as np

app = Flask(__name__)
PATH = "C:/Users/a.haiker/Desktop/Projects/Flutter/object_detector/backend/"

@app.route('/process_image', methods=['POST'])
def process_image():
    data = request.get_json()
    # print(data['pixels'])
    pixels = np.array(data['pixels'])
    # image = cv2.cvtColor(pixels, cv2.COLOR_RGB2BGR)
    cv2.imwrite('C:/Users/a.haiker/Desktop/Projects/Flutter/object_detector/backend/image.png', pixels)
    names = test.detection(PATH+"model/yolov3-spp.weights",
                           PATH+"model/yolov3-spp.cfg",
                           PATH+"image.png") # ["name","age","favorite color"] 
    ret = {"state":"success","result":", ".join(names)}
    return jsonify(ret)

if __name__ == '__main__':
    app.run(host='0.0.0.0',debug = True,port=12345)
