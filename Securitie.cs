//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace wpfKozhuhov
{
    using System;
    using System.Collections.Generic;
    
    public partial class Securitie
    {
        static Securitie sec;
        public static Securitie CreateSecuritie(int Id, string name, string sum, int SecuritieID)
        {
            sec = new Securitie();
            sec.Id = Id;
            sec.name = name;
            sec.SecuritieID = SecuritieID;
            sec.sum = sum;
            return sec;
        }
        public int Id { get; set; }
        public string name { get; set; }
        public int SecuritieID { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string sum { get; set; }
    
        public virtual Table Table { get; set; }
    }
}
