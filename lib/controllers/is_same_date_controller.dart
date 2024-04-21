bool isSameDateController(DateTime d1, DateTime d2) {
  d1 = d1.toUtc();
  d2 = d2.toUtc();
  var date1 = DateTime.utc(d1.year,d1.month,d1.day);
  var date2 = DateTime.utc(d2.year,d2.month,d2.day);
  
  if(date1.compareTo(date2) == 0){
    return true;
  }else{
    return false;
  }
}