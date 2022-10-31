using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SocialMedia.Core.Entities
{
    public partial class provincias
    {
        public provincias() 
        {
            Localidades = new HashSet<Localidades>();
        }
       
        
        public List<Localidades> Localidades { get; set; }

        public int ID { get; set; }
        public string DeProvincia { get; set; }

        public virtual ICollection<Localidades> Localidades { get; set; }

    }
}
