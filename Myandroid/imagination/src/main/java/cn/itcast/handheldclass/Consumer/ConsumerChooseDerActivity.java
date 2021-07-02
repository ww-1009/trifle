package cn.itcast.handheldclass.Consumer;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;

import cn.itcast.handheldclass.BaseActivity;
import cn.itcast.handheldclass.R;

public class ConsumerChooseDerActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_consumer_choose_der);
        initNavBar(false,"▼  服装设计师",false);
        //点击导航栏第一个按钮跳转到形象设计师选择界面
        ImageButton image_building = (ImageButton) findViewById(R.id.image_building);
        image_building.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                //Intent是一种运行时绑定（run-time binding）机制，它能在程序运行过程中连接两个不同的组件。
                //在存放资源代码的文件夹下下，
                Intent i = new Intent(ConsumerChooseDerActivity.this , ConsumerMainActivity.class);
                //启动
                startActivity(i);
            }
        });

        //点击导航栏第三个按钮跳转到个人信息管理界面
        ImageButton personal = (ImageButton) findViewById(R.id.personal);
        personal.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                //Intent是一种运行时绑定（run-time binding）机制，它能在程序运行过程中连接两个不同的组件。
                //在存放资源代码的文件夹下下，
                Intent i = new Intent(ConsumerChooseDerActivity.this , ConsumerOwnPageActivity.class);
                //启动
                startActivity(i);
            }
        });

        //点击第四张图片跳转到形象设计师信息界面
        LinearLayout image_d = (LinearLayout) findViewById(R.id.ImageDesignerSearch_image4);
        image_d.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(ConsumerChooseDerActivity.this , ConsumerDesignerOwn4Activity.class);
                startActivity(intent);
            }
        });
    }
}