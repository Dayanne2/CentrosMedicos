﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Proyecto.Entities.Entities
{
    public partial class tbSala
    {
        public tbSala()
        {
            tbPlantilla = new HashSet<tbPlantilla>();
        }

        public int? hospi_Id { get; set; }
        public int sala_Id { get; set; }
        public string sala_Nombre { get; set; }
        public int? sala_NumCamas { get; set; }

        public virtual tbHospiltales hospi { get; set; }
        public virtual ICollection<tbPlantilla> tbPlantilla { get; set; }
    }
}