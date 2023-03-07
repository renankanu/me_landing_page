enum TypeFile {
  makefile('makefile'),
  json('json'),
  shell('powershell');

  const TypeFile(this.description);
  final String description;
}
