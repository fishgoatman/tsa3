using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ZeusAutomationSuite.Helper;
using System.Data;
using System.IO;
using System.Reflection;
using Microsoft.TeamFoundation.TestManagement.Client;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Interactions;
using ZeusAutomationSuite.DataProviders;
using ZeusAutomationSuite.Extensions;
using System.Collections.Generic;
using System.Threading;
using RunAutomation.Helpers;

namespace SampleUnitTest
{
    [TestClass]
    public class SampleUnitTest
    {

        TestCaseHelper testCase = null;
        TestExecutions execution = null;
        string downloadDirectory = "";
        public SampleUnitTest()
        {
        }

        [TestInitialize]
        public void SetBrowserAsPerConfiguration()
        {

            PopulateConfigurations config = new PopulateConfigurations();
            var chromeOptions = new ChromeOptions();
            downloadDirectory = @"C:\Temp";
            chromeOptions.AddUserProfilePreference("download.default_directory", downloadDirectory);
            chromeOptions.AddUserProfilePreference("download.prompt_for_download", false);
            chromeOptions.AddUserProfilePreference("disable-popup-blocking", "true");
            if (Convert.ToString(TestContext.Properties["Module"]) == "TestData")
            {
                testCase = new TestCaseHelper();
                execution = new TestExecutions();
            }
            else
            {
                string ModuleName = Convert.ToString(TestContext.Properties["Module"]);
                testCase = new TestCaseHelper(ModuleName);
                execution = new TestExecutions(ModuleName, chromeOptions);
            }
            /*This code block will get executed while debugging/runing test locally or in case
                 Connection to TFS fails due any unknown reason*/
            //ConfigHelper.Environment = "INT";
            ConfigHelper.TestingTool = "selenium"; ConfigHelper.TestRunID = -1;

        }

        [TestCleanup]
        public void Cleanup()
        {
            //Playback.PlaybackSettings.WaitForReadyLevel = WaitForReadyLevel.Disabled;
        }



        [TestProperty("Module", "TestModule")]
        [TestMethod]
        public void extensionTest()
        {
            string LoginPage = "";
            bool result = true;
            ConfigHelper.Browser = "chrome";
            ConfigHelper.IsWebTest = "true";
            IWebDriver driver = null;
            List<TestStep> testSteps = execution.RetrieveTestSteps("WebTestforMobileAndPC.csv", ConfigHelper.TestingTool, LoginPage, testContextInstance);
            foreach (TestStep step in testSteps)
            {
                driver = step.Driver;
                if (execution.Keyword.Contains(step.Keyword))
                {
                    bool stepresult = step.ExecuteTestStep();
                    result = result & stepresult;
                }
            }
            driver.Dispose();
            Assert.IsTrue((result));
        }

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }
        private TestContext testContextInstance;

    }
}
