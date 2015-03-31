using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Model {
    public class Project {
        public int id { set; get; }
        public string name { set; get; }
        public User user { set; get; }
        public string courseNumber { set; get; }
        public string liveLink { set; get; }
        public string projectAbstract { set; get; }
        public string screencastLink { set; get; }
        public string semester { set; get; }
        public DateTime dateCreated { set; get; }
        public bool highlighted { set; get; }


        public List<Submissions> submission { set; get; }
        public List<Committee> committeMembers { set; get; }

        public List<String> keywords { set; get; }

        public int views { set; get; }
        public int downloads { set; get; }
    }
}