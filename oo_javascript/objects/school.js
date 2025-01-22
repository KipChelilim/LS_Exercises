function createStudent(name, year) {
  let student = {};
  student.name = name;
  student.year = year;
  student.courses = [];
  student.info = function() {
    console.log(`${this.name} is a ${this.year} year student.`);
  };

  student.addCourse = function(course) {
    this.courses.push(course);
  }

  student.listCourses = function() {
    console.log(this.courses);
  }

  student.addNote = function(code, note) {
    this.courses.forEach((course) => {
      if (course.code !== code) {
        return;
      } else if (course.note) {
        course.note += `; ${note}`;
      } else {
        course.note = note;
      }
    });
  }

  student.viewNotes = function() {
    this.courses.forEach((course) => {
      if (course.note) console.log(`${course.name}: ${course.note}`);
    });
  }

  student.updateNote = function(code, note) {
    this.courses.forEach((course) => {
      if (course.code === code) course.note = note;
    });
  }

  return student;
}

function createSchool() {
  return {
    students: [],

    addStudent(name, year) {
      const validYears = new Set(['1st', '2nd', '3rd', '4th', '5th']);
      let newStudent;
      if (validYears.has(year)) {
        newStudent = createStudent(name, year);
        this.students.push(newStudent);
      } else {
        console.log('Invalid Year');
      }

      return newStudent;
    },

    enrollStudent(student, course) {
      student.addCourse(course);
    },

    addGrade(student, courseCode, grade) {
      const course = student.courses.filter((course) => course.code === courseCode)[0];
      if (course) course.grade = grade;
    },

    getReportCard(student) {
      student.courses.forEach((course) => {
        let grade = course.grade ? course.grade : 'In progress';
        console.log(`${course.name}: ${grade}`);
      });
    },

    courseReport(courseName) {
      // collect student name and grades
        //  filter student if student.courses.includes
      // if there are no grades for the course log undefined
      // otherwise
        // get average
        // log grades
      let courseGrades = [];
      this.students.forEach((student) => {
        const foundCourse = student.courses.filter((course) => course.name === courseName)[0];
        if (foundCourse && foundCourse.grade) {
          courseGrades.push([student.name, foundCourse.grade]);
        }
      });

      if (courseGrades.length > 0) {
        let total = courseGrades.reduce((total, grade) => total += grade[1], 0);
        let average = total / courseGrades.length;
        console.log(`=${courseName} Grades=`);
        courseGrades.forEach((studentGrade) => console.log(`${studentGrade[0]}: ${studentGrade[1]}`));
        console.log(`---\nCourse Average: ${average}`);
      }
    },
  };
}

let school = createSchool();
let paul = school.addStudent('paul', '3rd');
let mary = school.addStudent('Mary', '1st');
let kim = school.addStudent('Kim', '2nd');

school.enrollStudent(paul, { name: 'Math', code: 101});
school.enrollStudent(paul, { name: 'Advanced Math', code: 102});
school.enrollStudent(paul,  { name: 'Physics', code: 202});
school.addGrade(paul, 101, 95)
school.addGrade(paul, 102, 90)
// console.log(paul);

school.enrollStudent(mary, { name: 'Math', code: 101});
school.addGrade(mary, 101, 91);
// console.log(mary);

school.enrollStudent(kim, { name: 'Math', code: 101});
school.enrollStudent(kim, { name: 'Advanced Math', code: 102});
school.addGrade(kim, 101, 93);
school.addGrade(kim, 102, 90);
// console.log(kim);


// school.getReportCard(paul);
// school.getReportCard(mary);
// school.getReportCard(kim);

school.courseReport('Math');
school.courseReport('Advanced Math');
school.courseReport('Physics');