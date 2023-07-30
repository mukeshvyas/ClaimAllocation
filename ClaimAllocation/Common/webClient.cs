using System.Net;

namespace ClaimAllocation.Common
{
    public class webClient
    {
        private readonly string baseUrl;
        public webClient() {
            baseUrl = "https://localhost:7100/api";
        }
        public string GetClientData(string param)
        {
            WebClient wclient = new WebClient();
            string urlTemp = string.Format("{0}/{1}", baseUrl, param).Trim('/');
            return wclient.DownloadString(urlTemp);
            
        }

        public string SetClientData(string param,string Data)
        {
            WebClient wclient = new WebClient();
            string urlTemp = string.Format("{0}/{1}", baseUrl, param).Trim('/');
            return wclient.UploadString(urlTemp, "Post", Data);

        }

    }
}
