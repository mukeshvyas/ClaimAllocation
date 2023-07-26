using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimModel
{
    public class ClaimCount
    {
        int ClaimUnassigned;
        int ClaimAssigned;
        int ClaimWIP;

        public int claimUnassigned
        {
            get { return ClaimUnassigned; }
            set { ClaimUnassigned = value; }
        }

        public int claimAssigned
        {
            get { return ClaimAssigned; }
            set { ClaimAssigned = value; }
        }

        public int claimWIP
        {
            get { return ClaimWIP; }
            set { ClaimWIP = value; }
        }
    }
}
