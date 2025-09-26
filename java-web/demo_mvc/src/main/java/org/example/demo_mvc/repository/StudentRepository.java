package org.example.demo_mvc.repository;

import org.example.demo_mvc.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository{

    private static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1,"chánh",true,8));
        studentList.add(new Student(2,"hải",true,5));
        studentList.add(new Student(3,"tiến",true,7));
        studentList.add(new Student(5,"sự",false,3));
    }
    @Override
    public List<Student> findAll() {
        return studentList;
    }

    @Override
    public boolean add(Student student) {
        return studentList.add(student);
    }
}
