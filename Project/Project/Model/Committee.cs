using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Project.Model {
    class Committee {
        public int id { set; get; }
        public Project project { set; get; }
        public string email { set; get; }
        public string type { set; get; }
    }
}
