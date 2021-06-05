import pandas as pd
import numpy as np
import time

def load_data():
    data_Initial = pd.read_csv("test.csv")
    data_preprocessed = data_Initial.drop('id', axis=1).drop('笔记', axis=1)
    word = data_preprocessed['单词']
    explain = data_preprocessed['解释']
    length = len(word)
    return word, explain, length


def shuffle_Index(length):
    shuffle_Indexes = np.random.permutation(length)
    return shuffle_Indexes


def extract_Word(test_Radio=0.02):
    word, explain, length = load_data()
    shuffle_Indexes = shuffle_Index(length)
    test_Size = int(test_Radio * length)
    test_Indexes = shuffle_Indexes[:test_Size]
    test_Word = [word[i] for i in test_Indexes]
    test_Explain = [explain[i] for i in test_Indexes]
    test_ExplainStriped = []
    for explain in test_Explain:
        test_ExplainStriped.append(explain.replace('\r', ''))
    return test_Word, test_ExplainStriped


def test():
    test_Word, test_ExplainStriped = extract_Word()
    wrong_List = []
    for index, word in enumerate(test_Word):
        print("当前的单词为   ", word)
        print("输入你的答案---------------------------------------------------------------------------")
        answer = input()
        while answer == "":
            print("你的输入为空，请重新输入")
            print("输入你的答案------------")
            answer = input()

        if answer in test_ExplainStriped[index]:
            print("输入正确")
            print("")
            print("")
            time.sleep(1)
        else:
            wrong_List.append([word, test_ExplainStriped[index]])
            print("输入错误, 已记录")
            time.sleep(1)
            print("")
            print("")

    print('------------------------------------------------------------------------------')
    time.sleep(2)
    print('你一共错了{}个单词'.format(len(wrong_List)))
    for index, wrong in enumerate(wrong_List):
        print("错的第{}个单词是 ".format(index+1), wrong[0])
        print("解释为  ", wrong[1])
        time.sleep(2)


if __name__ == '__main__':
    test()
