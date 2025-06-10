resource "random_integer" "s3_bucket_suffix" {
  min = 1000
  max = 9999
}

resource "aws_s3_bucket" "web_bucket" {
  bucket = "condormatics-prog8830-${random_integer.s3_bucket_suffix.result}"
}

resource "aws_s3_bucket_versioning" "web_bucket_versioning" {
  bucket = aws_s3_bucket.web_bucket.id

  versioning_configuration {
    status = "Disabled"
  }

}

resource "aws_s3_object" "html_file" {
  bucket = aws_s3_bucket.web_bucket.id
  key    = "./webcontent/index.html"
  source = "./webcontent/index.html"
}

resource "aws_s3_object" "stylesheet" {
  bucket = aws_s3_bucket.web_bucket.id
  key    = "./webcontent/styles.css"
  source = "./webcontent/styles.css"
}

resource "aws_s3_object" "campus_img" {
  bucket = aws_s3_bucket.web_bucket.id
  key    = "./webcontent/campus.jpg"
  source = "./webcontent/campus.jpg"
}

resource "aws_s3_object" "programs_img" {
  bucket = aws_s3_bucket.web_bucket.id
  key    = "./webcontent/programs.jpg"
  source = "./webcontent/programs.jpg"
}

resource "aws_s3_object" "students_img" {
  bucket = aws_s3_bucket.web_bucket.id
  key    = "./webcontent/students.jpg"
  source = "./webcontent/students.jpg"
}


