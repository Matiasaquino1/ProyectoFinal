using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SocialMedia.Core.Entities
{
    public partial class Diagnosticos
    {
        public int ID { get; set; }
        public string? DeCodigoDiagnostico { get; set; }
        public string? DeCodigo { get; set; }
    }
}
