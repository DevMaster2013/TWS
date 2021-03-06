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
    
    public partial class HumanMarriage
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HumanMarriage()
        {
            this.Childs = new HashSet<MarriageChild>();
            this.Pregnants = new HashSet<Pregnant>();
        }
    
        public long ID { get; set; }
        public long MaleHumanID { get; set; }
        public long FemaleHumanID { get; set; }
    
        public virtual MaleHuman Husband { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MarriageChild> Childs { get; set; }
        public virtual FemaleHuman Wife { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Pregnant> Pregnants { get; set; }
    }
}
