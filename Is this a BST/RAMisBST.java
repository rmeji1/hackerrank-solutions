/* Hidden stub code will pass a root argument to the function below. Complete the function to solve the challenge. Hint: you may want to write one or more helper functions.  

The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/
    boolean checkBST(Node root, int min, int max){
      if (root == null) return true ;
      
      if (root.data > min && root.data < max){
        // if left sucessful check right.
        if (checkBST(root.left, min, root.data)){
          return checkBST(root.right, root.data, max);
        }
      }
      return false ; 
    }
  
    boolean checkBST(Node root) {      
      return checkBST(root, 0, (int)Math.pow(10.0, 4.0)) ;
    }
