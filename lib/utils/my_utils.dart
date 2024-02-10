class MyUtils{
  static DateTime getDateTime(int dt) => DateTime.fromMillisecondsSinceEpoch(dt * 1000);


  static String getWeekday(String day){
    switch(day){
      case '1':
        return 'Monday';
      case '2':
        return 'Tuesday';
      case '3':
        return 'Wednesday';
      case '4':
        return 'Thursday';
      case '5':
        return 'Friday';
      case '6':
        return 'Saturday';
      default:
        return 'Sunday';
    }
  }


  static String getDay(String day){
    switch(day){
      case '1':
        return 'Mon';
      case '2':
        return 'Tu';
      case '3':
        return 'Wed';
      case '4':
        return 'Thu';
      case '5':
        return 'Juma';
      case '6':
        return 'Sat';
      default:
        return 'Sun';
    }
  }


  static String getMonth(String day){
    switch(day){
      case '1':
        return 'January';
      case '2':
        return 'February';
      case '3':
        return 'March';
      case '4':
        return 'April';
      case '5':
        return 'May';
      case '6':
        return 'June';
      case '7':
        return 'July';
      case '8':
        return 'August';
      case '9':
        return 'September';
      case '10':
        return 'October';
      case '11':
        return 'November';
      default :
        return 'December';
    }
  }
}