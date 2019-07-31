package com.aishang.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PaShuJu {
  /*  public static void main(String[] args){
        getArticles();
    }
    public static void getArticles(){
        String url = "http://www.jianshu.com";
        Document doc = Jsoup.connect(url).get();
        Elements articlelinks = doc.select("a[class = \"title\"]");
        print("\nLinks:(%d)",articlelinks.size());
    }*/
   /* private static String url = "https://blog.csdn.net";
    private static String blogName = "guoxiaolongonly";

    public static void main(String[] args) {
        getArticleListFromUrl(url + "/" + blogName);
    }

    public static void getArticleListFromUrl(final String listurl) {

        boolean isStop = false;
        Document doc = null;
        try {
            //Mozilla/66.0.5.7066 (Windows NT 6.1; Win64; x64) Chrome/74.0.3729.157
            doc = Jsoup.connect(listurl).userAgent("Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36").timeout(3000).post();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Elements elements = doc.getElementsByTag("a");//找到所有a标签
        for (Element element : elements) {
            final String relHref = element.attr("href"); // == "/"这个是href的属性值，一般都是链接。这里放的是文章的连接
            //用if语句过滤掉不是文章链接的内容。因为文章的链接有两个，但评论的链接只有一个，反正指向相同的页面就拿评论的链接来用吧
            if (!relHref.startsWith("http://") && relHref.contains("details") && relHref.endsWith("comments")) {
                StringBuffer sb = new StringBuffer();
                sb.append(relHref);
                System.out.println(sb.substring(0, sb.length() - 9));//去掉最后的#comment输出
                getArticleFromUrl(sb.substring(0, sb.length() - 9));//可以通过这个url获取文章了
            }
            if (relHref.equals("https://mp.csdn.net//postlist")) {
                isStop = true;
            }
        }
        if (!isStop) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    if (!listurl.contains("list")) {
                        getArticleListFromUrl(listurl + "/article/list/1");//获取下一页的列表
                    } else {
                        getArticleListFromUrl(listurl.substring(0, listurl.length() - 1) +
                                (Integer.valueOf(listurl.substring(listurl.length() - 1, listurl.length())) + 1));//获取下一页的列表
                    }
                }
            }).start();
        }
    }

    /**
     * 获取文章内容
     *
     * @param detailurl
     *//*
    public static void getArticleFromUrl(String detailurl) {
        try {
            Document document = Jsoup.connect(detailurl).userAgent("Mozilla/5.0").timeout(3000).post();
            Element elementTitle = document.getElementsByClass("link_title").first();//标题。 这边根据class的内容来过滤
            System.out.println(elementTitle.text());
            String filename = elementTitle.text().replaceAll("/", "或");
            Element elementContent = document.getElementsByClass("article_content").first();//内容。
            saveArticle(filename, elementContent.text(), blogName);
            // String Content =elementContent.te  xt().replaceAll(" ", "\t");
            // System.out.println(elementContent.text()+"\n");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 保存文章到本地
     *
     * @param titile
     * @param content
     * @param blogName
     */
    /*
    public static void saveArticle(String titile, String content, String blogName) {
        String lujing = "D:\\MyDownloads\\" + blogName + "\\" + titile + ".txt";//保存到本地的路径和文件名
        File file = new File(lujing);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        try {
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            FileWriter fw = new FileWriter(file, true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(content);
            bw.flush();
            bw.close();
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }*/



        public  Document getDocument(String url){
            try {
                return Jsoup.connect(url).get();


            } catch (IOException e) {
                e.printStackTrace();

            }
            return null;
        }

        public static void main(String[] args) {

            PaShuJu t=new PaShuJu();//实例化
            Document doc=t.getDocument("https://www.kongfz.com/3/");//双引号里面填写网址
            Elements elements1=doc.select("div[class=\"result-list\"]"); //双引号里面填写母标签
            Elements elements6=elements1.select("a");
            Elements elements2=elements1.select("span[class=\"book-type\"]");//双银号填写子标签，大家可以多尝试
            Elements elements5=elements1.select("span[class=\"price\"]");
            Elements elements3=elements1.select("img");
            Elements elements4=elements1.select("span");
            for(int i=0;i<51;i++){
                String A  ="name:"+elements2.get(i).text();
                String a2 = "价格:"+elements5.get(i).text();
                String A1  ="地址:"+elements6.get(i).attr("href");
                String B  ="图片地址:"+elements3.get(i).attr("src");
                String B1  ="作者:"+elements4.get(i).text();
              /*  System.out.println(A);
                System.out.println(A1);
                System.out.println(B);
                System.out.println(B1+"/////////");*/
                List list1 = new ArrayList();
                list1.add(A);
                list1.add(a2);
                list1.add(A1);
                list1.add(B);
                list1.add(B1);
                JSONArray array= JSONArray.parseArray(JSON.toJSONString(list1));
                for (Object d :array){
                    System.out.println(d);

                }
                System.out.println("-------------------------------------------------------------------------");
            }//拿稳微博热搜示例 犹豫每一行文字都是在tr里面 所以便循环输出一键搞定
            //这个for循环的意思是选取 tbody标签下的所有tr标签从0开始循环输出 犹豫微博热搜最多50个所以只循环50次
        }

    }

