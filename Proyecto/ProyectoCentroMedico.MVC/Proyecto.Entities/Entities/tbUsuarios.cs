﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Proyecto.Entities.Entities
{
    public partial class tbUsuarios
    {
        public int usu_ID { get; set; }
        public int rol_ID { get; set; }
        public string usu_Nombre { get; set; }
        public string usu_Apellido { get; set; }
        public string usu_Email { get; set; }
        public string usu_Password { get; set; }
        public string usu_PasswordSalt { get; set; }
        public string usu_NumeroTelefono { get; set; }
        public string usu_NumeroCelular { get; set; }

        public virtual tbRoles rol { get; set; }
    }
}