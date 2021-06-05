import face_recognition
import cv2 as cv
import numpy as np

def get_head_edge(whole_edge, head_bottom):
    outside_edge = []
    for i in range(whole_edge.shape[0]):
        arr = []
        for j in range(whole_edge.shape[1]):
            if whole_edge[i, j] >= 50:
                arr.append(j)
        if len(arr) != 0:
            outside_edge.append((i, arr[0]))
            outside_edge.append((i, arr[-1]))
    head_top = outside_edge[0][0]
    head_right = max([x for y, x in outside_edge if y <= head_bottom])
    head_left = min([x for y, x in outside_edge if y <= head_bottom])
    right_margin = max([x for y, x in outside_edge])
    bottom_margin = outside_edge[-1][0]
    return head_top, head_right, head_left, right_margin, bottom_margin


def get_head(people_address):
    image = face_recognition.load_image_file(people_address)
    img_arr = cv.imread(people_address)
    img_edge = cv.Canny(img_arr, 50, 200)
    face_top, face_right, face_bottom, face_left = face_recognition.face_locations(image)[0]
    head_top, head_right, head_left, right_margin, bottom_margin = get_head_edge(img_edge, face_bottom)
    head_bottom = face_bottom
    img_arr_face = img_arr.copy()
    img_arr_head = img_arr.copy()
    cv.rectangle(img_arr_face, (face_left, face_top), (face_right, face_bottom), (255, 0, 0), 3)
    cv.rectangle(img_arr_head, (head_left, head_top), (head_right, head_bottom), (255, 0, 0), 3)
    cv.imshow('face.jpg', img_arr_face)
    cv.imwrite('./head/face.jpg', img_arr_face)
    cv.imshow('head.jpg', img_arr_head)
    cv.imwrite('./head/head.jpg', img_arr_head)
    aoi_img_head = img_arr[head_top:head_bottom + 1, head_left:head_right + 1]
    head_people = int((bottom_margin - head_top + 1) / (head_bottom - head_top + 1))
    head_people_float = round((bottom_margin - head_top + 1) / (head_bottom - head_top + 1), 2)
    print(head_people)
    for i in range(0, head_people + 1):
        top = head_top + i * (head_bottom - head_top + 1)
        bottom = head_top + (i + 1) * (head_bottom - head_top + 1)
        left = right_margin + 1
        right = right_margin + 1 + head_right - head_left + 1
        if i == head_people:
            top_last = head_top + i * (head_bottom - head_top + 1) + 1
            height_redundant = bottom_margin - top_last
            head_redundant = img_arr[head_top:head_top + height_redundant , head_left:head_right + 1]
            img_arr[top_last:bottom_margin, left:right] = head_redundant
        else:
            img_arr[top:bottom, left:right] = aoi_img_head
    text = "{}".format(head_people_float)
    cv.putText(img_arr, text, (50, 50), cv.FONT_HERSHEY_COMPLEX, 1.0, (100, 200, 200), 1)
    cv.imshow('./head/change.jpg', img_arr)
    cv.imwrite('./head/change.jpg', img_arr)
    cv.waitKey(0)
    cv.destroyAllWindows()


if __name__ == '__main__':
    get_head('./people/person1.jpg')
