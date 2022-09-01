pragma solidity ^0.8.16;

contract college{

    string name;
    uint regn;
    string gender;
    uint year;

    struct Student{
        string StudentName;
        uint RegnNumber;
        string Gender;
        uint year;
    }

    Student student;

    // function setStudent() public {
    //     student = Student('Akshit',123,'Male',2019);
    // }

    function setStudent(string memory _name, uint _regn, string memory _gender, uint _year) public payable {
        name = _name;
        regn = _regn;
        gender = _gender;
        year = _year;

        student = Student(name,regn,gender,year);
    }

    function getStudentName() public view returns (string memory) {
        return student.StudentName;
    }

    function getStudentRegn() public view returns (uint){
        return student.RegnNumber;
    }
    function getStudentGender() public view returns (string memory){
        return student.Gender;
    }
    function getStudentYear() public view returns (uint){
        return student.year;
    }

}