using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.DynamicData;

namespace WebAppDynamicProject
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void TreeView1_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
        {
            //make the node that links to the current page the selected node.
            string currPage = Request.CurrentExecutionFilePath;

            if (currPage == e.Node.NavigateUrl)
            {
                e.Node.Select();
            }

            if (Session["UserOnline"] != null)
            {
                //LoginStatus.Text = "Welcome " + Session["UserOnline"].ToString();
            }

        }

        protected void TreeView1_DataBound(object sender, EventArgs e)
        {
            TreeView1.CollapseAll();
            //TreeView1.ExpandAll();
            TreeNode n = TreeView1.SelectedNode;

            //make sure there is a selected node first (if current page is not in web.sitemap, there wont be a selected node
            if (n != null)
            {
                string selNodePath = n.ValuePath;

                //remove nodes that are not in the direct path to the selected node
                for (int i = 0; i < TreeView1.Nodes.Count; i++)
                {
                    if (!selNodePath.Contains(TreeView1.Nodes[i].ValuePath.ToString()))
                    {
                        TreeView1.Nodes.Remove(TreeView1.Nodes[i]);
                        //we've removed one node, so we reduce i
                        i--;
                    }
                }

                foreach (TreeNode tsn in TreeView1.Nodes)
                {
                    //expand only the node that is parent to selectedNode
                    if (selNodePath.Contains(tsn.ValuePath.ToString()))
                    {
                        tsn.Expand();

                    }
                    //if node has child nodes, set the select action, else, make it selectable
                    if (tsn.ChildNodes.Count > 0)
                    {
                        tsn.SelectAction = TreeNodeSelectAction.Expand;
                    }
                    else
                    {
                        tsn.SelectAction = TreeNodeSelectAction.Select;
                    }

                    ProcessChildNode(selNodePath, tsn);
                }
            }
        }

        /// <summary>
        /// Iterates through the Treeview Nodes
        /// </summary>
        /// <param name="selNodePath">Path to the selected Node</param>
        /// <param name="tsn">Current Node (the node to be processed)</param>
        protected void ProcessChildNode(string selNodePath, TreeNode tsn)
        {
            //check child nodes
            if (tsn.ChildNodes.Count > 0)
            {

                foreach (TreeNode tsnChild in tsn.ChildNodes)
                {
                    //use recursion for deeper tree levels
                    if (tsnChild.ChildNodes.Count > 0)
                    {
                        //process child node
                        ProcessChildNode(selNodePath, tsnChild);
                    }
                    if (selNodePath.Contains(tsnChild.ValuePath.ToString()))
                    {
                        tsnChild.Expand();
                    }
                    if (tsnChild.ChildNodes.Count > 0)
                    {
                        tsnChild.SelectAction = TreeNodeSelectAction.Expand;
                    }
                }
            }
        }


    }
}
