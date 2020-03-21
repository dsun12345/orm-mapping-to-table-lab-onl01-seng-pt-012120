class Student

  attr_accessor :name, :grade
  attr_reader :id

<<<<<<< HEAD
  def initialize(name, grade, id = nil)
=======
  def initialize(name, grade, id=nil)
>>>>>>> 1a45b0fcb2e569805f1a7312c5f7fbb061034eb0
    @name = name 
    @grade = grade 
    @id = id 
  end 
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students(
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade, INTEGER
        )
      SQL
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table
    sql = <<-SQL 
      DROP TABLE students
    SQL
    DB[:conn].execute(sql)
  end 
  
  def save
<<<<<<< HEAD
    sql = <<-SQL 
      INSERT INTO students (name, grade) VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
=======
      sql = <<-SQL
  insert into students (name,grade) values(?,?);
  SQL
  DB[:conn].execute(sql, self.name, self.grade)
  @id = DB[:conn].execute("SELECT MAX(ID) AS LastID FROM students")[0][0]
>>>>>>> 1a45b0fcb2e569805f1a7312c5f7fbb061034eb0
  end 
  
  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student 
  end 
end
