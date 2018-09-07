// --------------------------------------------------------------------------------------------------------------------
// <copyright file="PopulateConfigurations.cs" company="Microsoft">
//   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//   THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
//   OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
//   ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//   OTHER DEALINGS IN THE SOFTWARE.
// </copyright>
// --------------------------------------------------------------------------------------------------------------------

namespace RunAutomation.Helpers
{
    using System;
    using ZeusAutomationSuite.Helper;
    using System.Configuration;
    using ZeusAutomationSuite.DataProviders;
    using System.Threading.Tasks;
    using System.IO;
    using System.Security;

    /// <summary>
    /// Sample file used while extending the functionality and reusing the ZeusAutomationSuite in another project(s)
    /// </summary>
    class PopulateConfigurations
    {
        /// <summary>
        /// The current dir
        /// </summary>
        private string currentDir = System.Environment.CurrentDirectory;

        public PopulateConfigurations()
        {
            #region THIS SECTION IS FOR BASIC CONFIGURATIONS FOR RUNNING TESTS
            ConfigHelper.ADDomain = ConfigurationManager.AppSettings["ADDomain"].ToString();
            ConfigHelper.ArtifactPath = System.IO.Path.Combine(ConfigurationManager.AppSettings["TestCaseFolderFullPath"].ToString(), "TestCases");
            ConfigHelper.CaptureScreenshotonstepFailure = Convert.ToBoolean(ConfigurationManager.AppSettings["CaptureScreenshotonstepFailure"].ToString());
            ConfigHelper.ClickItemSeperator = ConfigurationManager.AppSettings["ClickItemSeperator"];
            ConfigHelper.ObjectPropertySeparator = Convert.ToChar(ConfigurationManager.AppSettings["ObjectPropertySeparator"].ToString());
            ConfigHelper.ObjectPropertyValueSeparator = Convert.ToChar(ConfigurationManager.AppSettings["ObjectPropertyValueSeparator"].ToString());
            ConfigHelper.TestCaseSheetName = ConfigurationManager.AppSettings["TestCaseSheet"].ToString();
            ConfigHelper.Environment = ConfigurationManager.AppSettings["EnvrionmentURL"].ToString();
            ConfigHelper.MasterPlanSheetName = ConfigurationManager.AppSettings["MasterPlanSheet"].ToString();
            ConfigHelper.MasterPlanSheetPath = ConfigurationManager.AppSettings["ExcelFilePath"].ToString();
            ConfigHelper.DriverPath = "";
            ConfigHelper.IfTestAreforMobileBrowser = ConfigurationManager.AppSettings["IsWebTest"];
            #endregion

            #region SECTION IS FOR TESTING UWP AND MOBILE APPS
            ConfigHelper.AndroidActivityName = ConfigurationManager.AppSettings["AndroidAppActivity"];
            ConfigHelper.AndroidPackageName = ConfigurationManager.AppSettings["AndroidAppPackage"];
            ConfigHelper.AndroidVersion = ConfigurationManager.AppSettings["AndroidVersion"];
            ConfigHelper.DBConnectionString = ConfigurationManager.AppSettings["ConnectionString"].ToString();
            ConfigHelper.DeviceList = ConfigurationManager.AppSettings["DeviceList"];
            ConfigHelper.MobileServiceURL = ConfigurationManager.AppSettings["Appium-MobileDeviceServiceURL"];
            ConfigHelper.TFSProject = ConfigurationManager.AppSettings["TFSProject"].ToString();
            ConfigHelper.TFSService = ConfigurationManager.AppSettings["TFSService"].ToString();
            ConfigHelper.UWPAppName = ConfigurationManager.AppSettings["UWPAppNameorPath"];
            ConfigHelper.UWPServiceURL = ConfigurationManager.AppSettings["Appium-UWPServiceURL"];
            #endregion

            #region RESOURCE FILE PATH FOR TEST OBJECTS
            ApplicationObjectProvider.FullExternalResxFilePath = ConfigurationManager.AppSettings["FullExternalResxFilePath"];
            #endregion

            #region API TESTS RELATED CONFIGURATIONS
            ConfigHelper.APIAuthURL = ConfigurationManager.AppSettings["APIAuthURL"];
            ConfigHelper.APIEndPoint = ConfigurationManager.AppSettings["APIEndPoint"];
            ConfigHelper.APIClientID = ConfigurationManager.AppSettings["APIClientID"];
            ConfigHelper.APIClientSecret = ConfigurationManager.AppSettings["APIClientSecret"];
            #endregion

            #region AZURE RELATED CONFIGURATION
            ConfigHelper.SearchServiceName = ConfigurationManager.AppSettings["SearchServiceName"];
            ConfigHelper.SearchSearviceQueryKey = ConfigurationManager.AppSettings["SearchSearviceQueryKey"];
            ConfigHelper.MaximumResultsBySearchResults = ConfigurationManager.AppSettings["MaximumResultsBySearchResults"];
            #endregion

            #region AZURE KEYVALUT RELATED CONFIGURATION
            ConfigHelper.KeyvalutClientId = ConfigurationManager.AppSettings["ClientId"];
            ConfigHelper.KeyvalutClientSecret = ConfigurationManager.AppSettings["ClientSecret"];
            ConfigHelper.KeyvalutVaultUri = ConfigurationManager.AppSettings["VaultUri"];
            ConfigHelper.KeyvaultAppID = ConfigurationManager.AppSettings["KeyvaultAppID"];
            ConfigHelper.KeyvaultThumbprint = ConfigurationManager.AppSettings["KeyvaultThumbprint"];
            ConfigHelper.KeyvalutcertName = ConfigurationManager.AppSettings["certName"];
            ConfigHelper.KeyvalutcertPwd = ConfigurationManager.AppSettings["certPwd"];
            #endregion

        }

    }
}
