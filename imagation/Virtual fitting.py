import cv2 as cv
import numpy as np
import time
import matplotlib.pyplot as plt

def get_position(category, people_arr_outside_edge, head):
    arr_position = []
    height_min_coe = 0
    height_max_coe = 0
    if category == 'cloth':
        height_min_coe = 1.15
        height_max_coe = 4.2
    if category == 'jean':
        height_min_coe = 4.2
        height_max_coe = 7
    for k in range(len(people_arr_outside_edge)):
        if people_arr_outside_edge[0][0] + height_min_coe * head <= people_arr_outside_edge[k][0] <= people_arr_outside_edge[0][0] + height_max_coe * head:
            arr_position.append(people_arr_outside_edge[k])
    should_height = arr_position[-1][0] - arr_position[0][0]
    return arr_position, should_height


def get_outside_edge(whole_edge):
    outside_edge = []
    for i in range(whole_edge.shape[0]):
        arr = []
        for j in range(whole_edge.shape[1]):
            if whole_edge[i, j] >= 50:
                arr.append(j)
        for j in range(whole_edge.shape[1]):
            if len(arr) != 0 and j != arr[0] and j != arr[-1]:
                whole_edge[i, j] = 0
        if len(arr) != 0:
            outside_edge.append((i, arr[0]))
            outside_edge.append((i, arr[-1]))

    return whole_edge, outside_edge


def find_best_width(should_height, arr, people_arr, arr_position):
    best_width = []
    try:
        for k in range(people_arr.shape[1] - 1, 100, -10):
            new = cv.resize(arr, (k, should_height + 1), interpolation=cv.INTER_AREA)
            new_arr_whole_edge = cv.Canny(new, 10, 200)
            new_arr_whole_edge_changed, new_arr_outside_edge = get_outside_edge(new_arr_whole_edge)
            for i in range(0, should_height, 2):
                gap_1 = new_arr_outside_edge[i + 1][1] - new_arr_outside_edge[i][1]
                gap_person = arr_position[i + 1][1] - arr_position[i][1]
                assert gap_1 > gap_person
            best_width.append(k)
    except:
        print("找到最适合的宽度", best_width[-1])
        return best_width[-1]


def change_pixel(category, new, arr_position, people_arr, people_arr_gray):
    top_margin = 0
    bottom_margin = 0
    new_whole_edge = cv.Canny(new, 50, 200)
    new_whole_edge_changed, new_outside_edge = get_outside_edge(new_whole_edge)
    cv.imwrite('change/{}_new_outside_edge.jpg'.format(category), new_whole_edge_changed)
    if category == 'cloth':
        top_margin = int((arr_position[-1][0]-arr_position[0][0])*0.025)
        bottom_margin = int((arr_position[-1][0]-arr_position[0][0])*0.025)
    else:
        top_margin = int((arr_position[-1][0]-arr_position[0][0])*0.065)
        bottom_margin = int((arr_position[-1][0]-arr_position[0][0])*0.065)
    for i in range(0, int(len(arr_position) / 2)):
        gap_transient = new_outside_edge[2 * i + 1][1] - new_outside_edge[2 * i][1]
        gap_person = arr_position[2 * i + 1][1] - arr_position[2 * i][1]
        k = gap_transient / gap_person
        for j in range(arr_position[2 * i][1], arr_position[2 * i + 1][1] + 1):
            person_index = j - arr_position[2 * i][1]
            transient_index = person_index * k
            should_index_1 = int(transient_index)
            should_index_2 = should_index_1 + 1
            distance = transient_index - should_index_1
            new_col_1 = should_index_1 + new_outside_edge[2 * i][1]
            new_col_2 = should_index_2 + new_outside_edge[2 * i][1]
            initial_pixel_list = [people_arr[arr_position[2 * i][0], j, k] for k in range(0, 3)]
            changed_pixel = new[i][new_col_1] * distance + new[i][new_col_2] * (1 - distance)
            changed_pixel_list = [changed_pixel[k] for k in range(0, 3)]
            if int(changed_pixel_list[0]) + int(changed_pixel_list[1]) + int(changed_pixel_list[2]) <= 765 \
                    and int(initial_pixel_list[0]) + int(initial_pixel_list[1]) + int(initial_pixel_list[2]) <= 750:
                if arr_position[0][0] <= arr_position[i][0] <= (arr_position[0][0] + top_margin) or (arr_position[-1][0] - bottom_margin) \
                        <= arr_position[i][0] <= (arr_position[-1][0]):
                    if people_arr_gray[arr_position[2 * i][0], j] <= 90:
                        print("像素已从", people_arr[arr_position[2 * i][0], j, :], "更新为", changed_pixel)
                        people_arr[arr_position[2 * i][0], j, :] = changed_pixel
                else:
                    people_arr[arr_position[2 * i][0], j, :] = changed_pixel
                    print("像素已从", people_arr[arr_position[2 * i][0], j, :], "更新为", changed_pixel)
        if i % 8 == 0 and i != 0:
            cv.imshow("image", people_arr)
            cv.waitKey(1000)
            cv.destroyAllWindows()
            cv.imwrite('change/people_transient_{}_{}.jpg'.format(category, i), people_arr)
    print('--------已换装成功！！！--------')
    return people_arr


def change_imagination(people_address, cloth_address, jean_address):
    people_arr_ = cv.imread(people_address)
    people_arr = cv.resize(people_arr_, (450, 450))
    cloth_arr = cv.imread(cloth_address)
    jean_arr = cv.imread(jean_address)

    people_arr_gray = cv.cvtColor(people_arr, cv.COLOR_BGR2GRAY)
    cv.imwrite('./change/people_gray.jpg', people_arr_gray)
    people_arr_whole_edge = cv.Canny(people_arr, 50, 200)
    cv.imwrite('./change/people_edge.jpg', people_arr_whole_edge)

    cloth_arr_gray = cv.cvtColor(cloth_arr, cv.COLOR_BGR2GRAY)
    cv.imwrite('./change/cloth_gray.jpg', cloth_arr_gray)
    cloth_arr_whole_edge = cv.Canny(cloth_arr, 50, 200)
    cv.imwrite('./change/cloth_edge.jpg', cloth_arr_whole_edge)

    jean_arr_gray = cv.cvtColor(jean_arr, cv.COLOR_BGR2GRAY)
    cv.imwrite('./change/jean_gray.jpg', jean_arr_gray)
    jean_arr_whole_edge = cv.Canny(jean_arr, 50, 200)
    cv.imwrite('./change/jean_edge.jpg', jean_arr_whole_edge)

    people_arr_whole_edge_changed, people_arr_outside_edge = get_outside_edge(people_arr_whole_edge)
    cv.imwrite('./change/people_outside_change.jpg', people_arr_whole_edge_changed)

    cloth_arr_whole_edge_changed, cloth_arr_outside_edge = get_outside_edge(cloth_arr_whole_edge)
    cv.imwrite('./change/cloth_outside_change.jpg', cloth_arr_whole_edge_changed)

    jean_arr_whole_edge_changed, jean_arr_outside_edge = get_outside_edge(jean_arr_whole_edge)
    cv.imwrite('./change/jean_outside_change.jpg', jean_arr_whole_edge_changed)

    people_height = people_arr_outside_edge[-1][0] - people_arr_outside_edge[0][0]
    head = people_height / 7.5
    print("一个头的高度是", head)
    cloth_arr_position, cloth_should_height = get_position('cloth', people_arr_outside_edge, head)
    print(cloth_should_height)
    print(cloth_arr_position)
    jean_arr_position, jean_should_height = get_position('jean', people_arr_outside_edge, head)

    best_width_cloth = find_best_width(cloth_should_height, cloth_arr, people_arr, cloth_arr_position)
    best_width_jean = find_best_width(jean_should_height, jean_arr, people_arr, jean_arr_position)
    print("已经找到最合适的衣服宽度", best_width_cloth)
    print("已经找到最合适的裤子宽度", best_width_jean)
    cloth_new = cv.resize(cloth_arr, (best_width_cloth, cloth_should_height + 1), interpolation=cv.INTER_AREA)
    cv.imwrite('change/cloth_new.jpg', cloth_new)
    jean_new = cv.resize(jean_arr, (best_width_jean, jean_should_height + 1), interpolation=cv.INTER_AREA)
    cv.imwrite('change/jean_new.jpg', jean_new)
    people_changed_arr_cloth = change_pixel('cloth', cloth_new, cloth_arr_position, people_arr, people_arr_gray)
    cv.imwrite('change/person_change_cloth.jpg', people_changed_arr_cloth)
    people_changed_arr_jean = change_pixel('jean', jean_new, jean_arr_position, people_changed_arr_cloth,
                                           people_arr_gray)
    people_changed_arr = people_changed_arr_jean
    cv.imwrite('change/person_change_final.jpg', people_changed_arr)


if __name__ == '__main__':
    change_imagination('./people/person1.jpg', './cloth/cloth1.jpg', './jean/jean1.jpg')
