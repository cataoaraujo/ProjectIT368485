using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FinalProject.Model {
    public class Submissions {
        public int id { set; get; }
        public Project project { set; get; }
        public Document document { set; get; }
        public string type { set; get; }
        public bool approved { set; get; }
        public DateTime dateSubmitted { set; get; }

    }
}
