/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-05-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global class BatchApex implements Database.Batchable<SObject> {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Define the SOQL query to retrieve records to process
        return Database.getQueryLocator('SELECT Id, Name FROM Account WHERE CreatedDate >= LAST_WEEK');
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope) {
        // Process the records in the batch
        for (Account acc : scope) {
            acc.Name = 'Processed - ' + acc.Name;
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext BC) {
        // Perform any post-processing tasks after the batch completes
        System.debug('Batch job completed successfully');
    }
}

//Different ways to execute a batch

//One time
//BatchApex batch = new BatchApex();
//Database.executeBatch(batch, 50); // Process records in batches of 50

//Scheduled Batch
/*
String jobName = 'MyBatchJob';
String cronExpression = '0 0 3 * * ?'; // Schedule to run every day at 3 AM
BatchApex batch = new BatchApex();
System.scheduleBatch(batch, jobName, 1, 200, cronExpression);
*/

//Disable the batch
/*
String jobName = 'MyBatchJob';
Id jobId = [SELECT Id FROM CronTrigger WHERE CronJobDetail.Name = :jobName].Id;
System.abortJob(jobId);
*/

//Declaratively
/*
Alternatively, you can disable a scheduled batch job by deactivating the corresponding CronTrigger record 
in the Salesforce user interface. To do this, navigate to Setup > Scheduled Jobs,
find the job you want to disable, and click the "Deactivate" button.
*/