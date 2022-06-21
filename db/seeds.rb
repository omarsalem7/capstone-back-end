# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Course.create(name:"Amature people", description:"this is the sepcial course for Amature",location: "Italy", size:"8*7",price:578,image:"https://cdn.pixabay.com/photo/2016/12/29/17/01/golf-1938932_960_720.jpg")

Course.create(name:"Expert trainner glof", description:"You are need to be an expert goal, this is the right place",location: "France", size:"10*11",price:1200,image:"https://cdn.pixabay.com/photo/2017/01/07/17/25/golfer-1960998_960_720.jpg")

Course.create(name:"The man of the golf", description:"Monster trainner with good court",location: "Paris", size:"8*9",price:845,image:"https://cdn.pixabay.com/photo/2017/07/07/02/49/green-2480256_960_720.jpg")

Course.create(name:"quick learn golf", description:"this is the sepcial course for beginner",location: "Kingdom", size:"7*7",price:458,image:"https://cdn.pixabay.com/photo/2016/12/29/17/01/golf-1938932_960_720.jpg")

Course.create(name:"Advanced golf", description:"this is the third training course",location: "Africa", size:"10*12",price:1080,image:"https://images.unsplash.com/photo-1632946269126-0f8edbe8b068?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2031&q=80")

Course.create(name:"Expert golf", description:"this is the seccond training course",location: "US", size:"7*8",price:350,image:"https://images.pexels.com/photos/914682/pexels-photo-914682.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

Course.create(name:"golf train", description:"this is the first training course",location: "Egypt", size:"5*6",price:455,image:"https://images.freeimages.com/images/large-previews/1c6/golf-ball-in-the-fairway-1394202.jpg")

User.create(name:"test", role:"admin")
Reservation.create(date:"21-7-2022", city:"cairo",user_id: 1, course_id: 1)
Reservation.create(date:"22-5-2023", city:"Egypt",user_id: 1, course_id: 2)
