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

let foo = createStudent('Foo', '1st');
foo.info();
// "Foo is a 1st year student"
foo.listCourses();
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// "Math: Fun course; Remember to study for algebra"
// "Advance Math: Difficult subject"
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// "Math: Fun course"
// "Advanced Math: Difficult subject"