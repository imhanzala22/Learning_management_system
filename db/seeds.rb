# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Admin.find_or_create_by(email: "admin@lms.com", password:"Amroodlabs@1234")
Grade.find_or_create_by( grade_type: "Pending")
Grade.find_or_create_by( grade_type: "A+")
Grade.find_or_create_by( grade_type: "A")
Grade.find_or_create_by( grade_type: "B+")
Grade.find_or_create_by( grade_type: "B")
Grade.find_or_create_by( grade_type: "C+")
Grade.find_or_create_by( grade_type: "C")
Grade.find_or_create_by( grade_type: "D")
Semester.find_or_create_by(semester_type: "Fall", semester_no: "1")
Semester.find_or_create_by(semester_type: "Fall", semester_no: "2")
Semester.find_or_create_by(semester_type: "Fall", semester_no: "3")
Semester.find_or_create_by(semester_type: "Fall", semester_no: "4")
Semester.find_or_create_by(semester_type: "Fall", semester_no: "5")
Semester.find_or_create_by(semester_type: "Fall", semester_no: "6")
Semester.find_or_create_by(semester_type: "Fall", semester_no: "7")
Semester.find_or_create_by(semester_type: "Fall", semester_no: "8")
Semester.find_or_create_by(semester_type: "Spring", semester_no: "1")
Semester.find_or_create_by(semester_type: "Spring", semester_no: "2")
Semester.find_or_create_by(semester_type: "Spring", semester_no: "3")
Semester.find_or_create_by(semester_type: "Spring", semester_no: "4")
Semester.find_or_create_by(semester_type: "Spring", semester_no: "5")
Semester.find_or_create_by(semester_type: "Spring", semester_no: "6")
Semester.find_or_create_by(semester_type: "Spring", semester_no: "7")
Semester.find_or_create_by(semester_type: "Spring", semester_no: "8")

