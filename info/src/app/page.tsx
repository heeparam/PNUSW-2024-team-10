import { NotionAPI } from "notion-client";
import styles from "./page.module.css";
import NotionView from "./notion";

export default async function Home() {
  const collection_id = process.env.COLLECTION_ID;
  if (!collection_id) {
    throw new Error("No collection ID provided");
  }

  const notion = new NotionAPI();
  const infoPage = await notion.getPage(collection_id);

  return (
    <article className={styles.main}>

      <NotionView recordMap={infoPage} />
    </article>
  );
}
