public class HelloWorld {
    private String greeting = 'Hello World';
    public String publicgreeting = 'Public Greeting';
    
    /*
    private String goodMorning = 'goodMorning';
    private String goodAfternoon = 'goodAfternoon';
    private String goodEvening = 'goodEvening';*/

    public void printMessage(String msg){
        System.debug(msg);
    }

    public String getDay(Integer dayNumber){
        String dayString='';
        switch on dayNumber {
            when 0  {
                System.debug('Sunday');
            }
            when 1 {
                System.debug('Monday');
            }
            when 2 {
                System.debug('Tuesday');
            }
            when 3 {
                System.debug('Wednesday');
            }
            when 4 {
                System.debug('Thrusday');
            }
            when 5 {
                System.debug('Friday');
            }
            when 6 { 
                System.debug('Saturday');
            }
            when else {
                dayString = 'Not a valid day';
            }
        }

        return dayString;
    }
    public String getDay(String dayAbbre){
    String dayString='';
        switch on dayAbbre {
            when 'Sun'  {
                dayString = 'Sun';
            }
            when 'Mon' {
                dayString = 'Mon';
            }
            when  'Tue'{
                dayString = 'Tue';
            }
            when 'Wed' {
                dayString = 'Wed';
            }
            when 'Thur' {
                dayString = 'Thur';
            }
            when 'Fri' {
                dayString = 'Fri';
            }
            when 'Sat' { 
                dayString = 'Sat';
            }
            when else {
                dayString = 'Not a valid day';
            }
        }

        return dayString;
    }
            
    /*
    public void printGoodMorning() {
        System.debug(goodMorning);
    }

        public void printGoodAfternoon() {
        System.debug(goodAfternoon);
    }

        public void printGoodEvening() {
        System.debug(goodEvening);
    }

    public void printGreeting() {
        System.debug(greeting);
    }
    public void publicPrintGreeting() {
        System.debug(publicgreeting);
    }*/
}