const path = require("path"); 
module.exports = {
    entry: './src/main.js', 
    output: {
        path: path.resolve(__dirname, './dist'), //output path
        filename: 'bundle.js' //name of output file
    },
    module:{

        rules: [  
            {  
                test: /\.css$/,    //打包规则应用到以css结尾的文件上
                use: ['style-loader', 'css-loader']
            }  
        ]  
    }
}