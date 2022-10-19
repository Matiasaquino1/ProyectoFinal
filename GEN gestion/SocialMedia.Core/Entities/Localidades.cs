using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SocialMedia.Core.Entities
{
    public partial class Localidades
    {
        public int ID { get; set; }
        public string? DeLocalidad { get; set; }     
        public String? DeCdPostal { get; set; }

        public virtual provincias? Provincias { get; set; } 
        public virtual Pacientes? Pacientes { get; set; }
        public virtual Medicos? Medicos { get; set; }
     
    }
}
