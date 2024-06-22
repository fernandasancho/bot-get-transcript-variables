@IsTest
public class GetTranscriptVariablesTest {

    @IsTest
    static void testGetUserName() {
        // Step 1: Create test data for LiveChatTranscript
        LiveChatTranscript lct = new LiveChatTranscript();
        lct.Name = 'Test Transcript';
        lct.FirstName__c = 'Fernanda';
        insert lct;
        
        // Step 2: Create test data for TranscriptInput
        GetTranscriptVariables.TranscriptInput input = new GetTranscriptVariables.TranscriptInput();
        input.routableID = lct.Id;
        
        List<GetTranscriptVariables.TranscriptInput> inputs = new List<GetTranscriptVariables.TranscriptInput>();
        inputs.add(input);
        
        // Step 3: Call the getUserName method
        Test.startTest();
        List<GetTranscriptVariables.VisitorNameOutput> outputs = GetTranscriptVariables.getUserName(inputs);
        Test.stopTest();
        
        // Step 4: Verify the results
        System.assertEquals(1, outputs.size(), 'There should be one output');
        System.assertEquals('John', outputs[0].sFirstName, 'The first name should be Fernanda');
    }
}
