pragma solidity ^0.4.20;

contract AppSys {
    //Set of States
    enum StateType { RequestNewApplication, IssuedCriminalRecord, IssuedApostille, SentSupportingMaterialsFromSchool, SentSupportingMaterialsFromCompany, IssuedHealthRecord, IssuedWorkPermit, Completed }
    
    //List of properties
    StateType public  State;
    address public  Applicant;
    address public  LocalGovernment;
    address public  PublicNotary;
    address public  School;
    address public  Company;
    address public  Clinic;
    address public  ConsulateOffice;
    address public  FederalGovernment;
    
    string public ExtractedData;
    string public Application;
    string public ApplicantBirth;
    string public ApplicantIdPhoto;
    string public IssuedCriminalRecord;
    string public IssuedApostille;
    string public ReceivedSupportingMaterialsFromSchool;
    string public ReceivedSupportingMaterialsFromCompany;
    string public IssuedHealthRecord;
    string public IssuedWorkPermit;
    string public IssuedVisa;


    // constructor function
    constructor(string application, string birth, string photoUrl) public
    {
        Applicant = msg.sender;
        Application = application;
        ApplicantBirth = birth;
        ApplicantIdPhoto = photoUrl;
        State = StateType.RequestNewApplication;
    }

    // call this function to send a new application
    function SendApplication() public
    {
        require(Applicant == msg.sender);
        State = StateType.RequestNewApplication;
    }

    // call this function to send supporting materials from school
    function SendSupportMaterialsFromSchool(string supportMaterials) public
    {
        ReceivedSupportingMaterialsFromSchool = supportMaterials;
        State = StateType.SentSupportingMaterialsFromSchool;
        School = msg.sender;
    }

    // call this function to send supporting materials from company
    function SendSupportMaterialsFromCompany(string supportMaterials) public
    {
        ReceivedSupportingMaterialsFromCompany = supportMaterials;
        State = StateType.SentSupportingMaterialsFromCompany;
        Company = msg.sender;

    }

    // call this function to extract specific data for processing application
    function ExtractData(string extractData) public
    {
        ExtractedData = extractData;
    }

    // call this function to approve issuing criminal record
    function ApproveCriminalRecord(string content) public
    {
        IssuedCriminalRecord = content;
        State = StateType.IssuedCriminalRecord;
        LocalGovernment = msg.sender;
    }

    // call this function to approve issuing apostille
    function ApproveApostlle(string content) public
    {
        IssuedApostille = content;
        State = StateType.IssuedApostille;
        PublicNotary = msg.sender;
    }

    // call this function to approve issuing health record
    function ApproveHealthRecord(string content) public
    {
        IssuedHealthRecord = content;
        State = StateType.IssuedHealthRecord;
        Clinic = msg.sender;
    }

    // call this function to approve issuing work permit
    function ApproveWorkPermit(string content) public
    {
        IssuedWorkPermit = content;
        State = StateType.IssuedWorkPermit;
        ConsulateOffice = msg.sender;
    }

    // call this function to approve issuing visa
    function ApproveVisa(string content) public
    {
        IssuedVisa = content;
        State = StateType.Completed;
        FederalGovernment = msg.sender;
    }

    // call this function to reject application
    function Reject(string content) public
    {
        IssuedCriminalRecord = content;
        State = StateType.IssuedCriminalRecord;
    }

    // call this function to send a request
    // function SendRequest(string requestMessage) public
    // {
    //     if (Requestor != msg.sender)
    //     {
    //         revert();
    //     }
    //     RequestMessage = requestMessage;
    //     State = StateType.Request;
    // }

    // call this function to send a response
    // function SendResponse(string responseMessage) public
    // {
    //     Responder = msg.sender;

    //     ResponseMessage = responseMessage;
    //     State = StateType.Respond;
    // }
}