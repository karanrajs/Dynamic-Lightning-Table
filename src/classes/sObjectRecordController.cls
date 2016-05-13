/**
* This apex class to return the list of records for the specified object
* 
* @Author  Karanraj Sankaranarayanan 
* @version 1.0
* @since   2016-5-12
*/ 

public class sObjectRecordController {
    /**
     * This method is used to return recently view records
     * @param ObjectName - Specify the API name of object to get recently view records
     * @param fieldstoget - Fields from the object need to get
     * @param pageNumber - Number of the page to display in the table
     * @param pageSize - Number of records needs to be displayed in the page
     */ 
    @AuraEnabled public static lightningTableWrapper getRecords(String ObjectName,String fieldstoget,decimal pageNumber, String pageSize){     
       
        integer offset = (integer.valueOf(pageNumber) - 1) * integer.valueof(pageSize);
        String queryString = 'Select '+ String.escapeSingleQuotes(fieldstoget)+
                             ' from '+ String.escapeSingleQuotes(ObjectName) +
                             ' Limit '+ String.escapeSingleQuotes(pageSize) + ' Offset '+offset;      
        lightningTableWrapper ltw = new lightningTableWrapper();
        ltw.total = database.countQuery('Select count() from '+String.escapeSingleQuotes(ObjectName));
        ltw.page = Integer.valueOf(pageNumber);
        ltw.sObjectrecords = database.query(queryString);
        return ltw;
    }
}