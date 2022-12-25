//create question model
// create a simple class
class Question {
  //define how the question look like
  //every question will have id
  final String id;
  //every question will have a title (question itself)
  final String title;
  //every question will have options
  final Map<String, bool> options;
  // option will be like = {'1':true, '2'=false}

//create a constructor
  Question({
    required this.id,
    required this.title,
    required this.options,
  });

//override the toString method to print the question on console
  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options)';
  }
}
