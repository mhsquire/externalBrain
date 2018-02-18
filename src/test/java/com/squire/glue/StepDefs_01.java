package com.squire.glue;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import java.io.File;
import java.io.IOException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
/**
 * Created by Matthew Squire on 8/15/17.
 */


public class StepDefs_01 {
    private static final Logger log = LogManager.getLogger("StepDefs_01");

    @cucumber.api.java.en.Given("^there are files to test$")
    public void thereAreFilesToTest() throws Throwable {

        File source = new File("TestingGround/files/");
        log.info("Test info");
        log.debug("Test debug");
        log.warn("Test warning");
        log.error("Test error");
        File target = new File("TestingGround/testground/");

        File[] args = {source, target};
        deleteFiles(args);
        copyFiles(args);
        File file = new File(target.toPath().toString());
        assert (file.isDirectory());
        assert (file.list().length>0);
    }

    private void deleteFiles(File[] args) {
        try {
            new FileDeleter(args);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void copyFiles(File[] args) {
        try {
            new FileCopier(args);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @When("^the user types in a location into the textfield$")
    public void theUserTypesInALocationIntoTheTextfield() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @Then("^the location is added to the location list$")
    public void theLocationIsAddedToTheLocationList() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @Given("^the text box is empty$")
    public void theTextBoxIsEmpty() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @When("^the user clicks the add button$")
    public void theUserClicksTheAddButton() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @Then("^the directory chooser is launched$")
    public void theDirectoryChooserIsLaunched() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @And("^The user clicks add$")
    public void theUserClicksAdd() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @And("^the user chooses a directory$")
    public void theUserChoosesADirectory() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @Then("^the location of the directory is added to the location list$")
    public void theLocationOfTheDirectoryIsAddedToTheLocationList() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @When("^the user adds a string to the text field$")
    public void theUserAddsAStringToTheTextField() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @And("^clicks the add button$")
    public void clicksTheAddButton() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }

    @Then("^it is checked to make sure it is a valid file path$")
    public void itIsCheckedToMakeSureItIsAValidFilePath() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new PendingException();
    }
}
