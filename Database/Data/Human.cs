//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Database.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Human
    {
        public long ID { get; set; }
        public string Name { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public string DateOfDeath { get; set; }
        public bool Sex { get; set; }
        public double BaseFertilityLevel { get; set; }
        public double BaseMarriageDesire { get; set; }
    
        public virtual MarriageChild ChildInfo { get; set; }
        public virtual IllegalChild IllegalChild { get; set; }
    }
}
