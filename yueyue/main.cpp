#include <iostream>
using namespace std;
class Teacher{
private:
    string name;
    int age;
public:
    void teach(){
        cout<<"teach";
    }
};
class Student{
private:
    string name;
    int Sno;
public:
    void study(){
        cout<<"study";
    }
};

class Graduate :public Teacher, public Student{
private:
    string mxy_name;
    int mxy_ageg;
    int mxy_idg;
public:
    Graduate(string name,int age,int id){
        mxy_name = name;
        mxy_ageg = age;
        mxy_idg = id;

    }
    void show(){
        cout<<"name="<<mxy_name<<endl;
        cout<<"age="<<mxy_ageg<<endl;
        cout<<"id="<<mxy_idg<<endl;
    };
};


class Shape{
    virtual void getArea(){};
    virtual void getLen(){};
};

class Rectangle :public Shape{
private:
    double length;
    double width;
public:
    Rectangle(double length, double width){
        this->length = length;
        this->width = width;
    }
    void getArea() override;
    void getLen() override ;
};

void Rectangle::getArea() {
    cout<<"rectangle area="<<length*width<<endl;
}

void Rectangle::getLen() {
    cout<<"rectangle len="<< 2*(length+width)<<endl;
}

class Circle :public Shape{
private:
    double radius;
public:
    Circle(double radius){
        this->radius = radius;
    }
    void getArea() override;
    void getLen() override;
};

void Circle::getArea() {
    cout<<"circle area="<<3.14*radius*radius<<endl;
}

void Circle::getLen() {
    cout<<"circle len="<<2*3.14*radius<<endl;
}

void test(){
    cout<<"mxy";
}
class Counter{
    
};
int main() {
    Rectangle rectangle(4,5);
    rectangle.getArea();
    rectangle.getLen();
    Circle circle(3);
    circle.getArea();
    circle.getLen();
    test();
    return 0;
}
/*
 *  Graduate gra("mxy", 20, 20134216);
    gra.show();
    gra.teach();
    gra.study();
 */
