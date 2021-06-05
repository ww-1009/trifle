from PIL import Image
from removebg import RemoveBg
import cv2 as cv
import numpy as np


def delete_bg(img):
    rmbg = RemoveBg("U16nQBZ9uB2w93m8QU3a3aGa", "error.log")
    rmbg.remove_background_from_img_file(img)



def change_bg_to_white(img):
    delete_bg(img)
    im = Image.open('%s' % img + '_no_bg.png')
    x, y = im.size
    try:
        p = Image.new('RGBA', im.size, (255, 255, 255))
        p.paste(im, (0, 0, x, y), im)
        p.save('%s' % img + '_changedbg.png')
    except:
        with open('./error.log', 'a') as f:
            f.write('background change fail.')


def generate_pic(img):
    # 自动调整对比度
    img = cv.imread(img, 0)
    img = cv.resize(img, None, fx=0.5, fy=0.5)
    clahe = cv.createCLAHE(clipLimit=2.0, tileGridSize=(8, 8))
    dst = clahe.apply(img)
    cv.imshow("img", img)
    cv.imshow("dst", dst)
    cv.waitKey()


def ruihua(img):
    initial = cv.imread(img)
    kernel = np.array([[0, -1, 0], [-1, 5, -1], [0, -1, 0]], np.float32)  # 定义一个核
    dst = cv.filter2D(initial, -1, kernel=kernel)
    cv.imwrite('%s' % img + 'ruihua.jpg', dst)
    cv.imshow('ruihua', dst)
    cv.waitKey(0)


def GaussianBlur(img):
    # 高斯滤波 降噪
    img = cv.imread(img)
    gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
    gaussianBlur = cv.GaussianBlur(gray, (3, 3), 0)
    cv.imshow('guassianBlur', gaussianBlur)
    cv.waitKey(0)


def edilation(img):
    # 先腐蚀再膨胀 进行开运算
    img = cv.imread(img)
    kernel = np.ones((5, 5), np.uint8)
    dilation = cv.dilate(img, kernel, iterations=1)
    cv.imshow('dilation', dilation)
    cv.waitKey(0)


if __name__ == '__main__':
    change_bg_to_white('huide.jpg')
