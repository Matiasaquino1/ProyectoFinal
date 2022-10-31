using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SocialMedia.Core.Entities
{
    public partial class Medicos
    {
        public Medicos() 
        {
            Localidades = new HashSet<Localidades>();
        }

        public int Id { get; set; }
        public int LocalidadID { get; set; }
        public string NuMatricula { get; set; }
        public string DeNombre { get; set; }
        public string DeApellido {get; set; }
        public string DeDomicilio {get; set; }
        public string DeTipoDocumento {get; set; }
        public int NuDocumento { get; set; }
        public DateTime FeNacimiento { get; set; }
        public string DeSexo { get; set; }
        public string DeTelefono { get; set; }
        public string DeCelular { get; set; }
        public string DeEmail { get; set; }
        public DateTime FeAlta { get; set; }
        public string DeOcupacion { get; set; }
        public string DeNumeroAfiliado { get; set; }

        virtual public ICollection<Localidades> Localidades { get; set; }
        virtual public ICollection<Consultas> Consultas { get; set; }

    }
}
