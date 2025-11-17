/**
 * Class Name : InvoiceProjectFetcher
 * Purpose    : Retrieve Invoices with related Project and Account details where Account Industry = 'Finance'
 * Author     : Vasantharaj K
 * Date       : 17-Nov-2025
 */

public class InvoiceProjectFetcher {

    public static void displayFinanceInvoices() {

        // Fetch Invoices with parent Project and Account details
        List<Invoice__c> invList = [
            SELECT Id, Name,
                   Project__r.Name,
                   Project__r.Account.Name,
                   Project__r.Account.Industry
            FROM Invoice__c
            WHERE Project__r.Account.Industry = 'Finance'
        ];

        System.debug('--- Finance Industry Invoices ---');

        for (Invoice__c inv : invList) {
            System.debug(
                'Invoice: ' + inv.Name +
                ' | Project: ' + inv.Project__r.Name +
                ' | Account: ' + inv.Project__r.Account.Name +
                ' | Industry: ' + inv.Project__r.Account.Industry
            );
        }
    }
}

//Anonymous Apex Execution
InvoiceProjectFetcher.displayFinanceInvoices();
