using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SocialMedia.Core.DTOs
{
    public partial class InformesDTO
    {
        public int Id { get; set; }
        public int PacienteID { get; set; }
        public int MedicoReferenteID { get; set; }
        public int MedicoTratanteID { get; set; }
        public int MedicoAnetesistaID { get; set; }
        public int EstudioID { get; set; }
        public int MedicacionID { get; set; }
        public DateTime FeInforme { get; set; }
        public string DeMotivoDeInforme { get; set; }
        public string DeHallazgo { get; set; }
        public string DeEquipoUsado { get; set; }
        public string DeDescripcionPreparacion { get; set; }
        public string TiEstado { get; set; }
        
    }
}
