package com.cykj.springbootweb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan("com.cykj.springbootweb.mapper")
public class App 
{
	public static void main( String[] args )
    {
        SpringApplication.run(App.class, args);
    }
}
