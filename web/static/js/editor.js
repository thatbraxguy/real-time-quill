import Quill from "quill";

const editor = new Quill('#document', {
  theme: 'snow',
  placeholder: 'Something something collaboration?'
});


export default editor;