using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SocialMedia.Core.Entities
{
    public partial class Consultas
    {

        public int Id { get; set; }
        public int PacienteID { get; set; }
        public int MedicoID { get; set; }
        public DateTime FeConsulta { get; set; }
        public  string? DeAntecendenteEnfermedadActual { get; set; }
        public string? DeMotivoConsulta {  get; set; }
        public string? DeExamenFisico { get; set; }
        public string? DeIndicaciones { get; set; }
        public string? DeTratamiento { get; set; }

        virtual public ICollection<Pacientes>? Pacientes { get; set; }
        virtual public ICollection<Medicos> Medicos { get; set; }
    }
}
