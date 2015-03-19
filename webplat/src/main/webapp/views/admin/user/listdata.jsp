

    <tr>
        <td class="data-operator">
            <label class="checkbox-inline">
                <input type="checkbox" name="data-iDsId" value="{/$item['iDsId']/}"> 
                &nbsp;&nbsp;&nbsp;
            </label>
            <a data-id="{/$item['iDsId']/}" href="" class="edit invisible" title="修改">
                <span class="glyphicon glyphicon-edit"></span> 修改
            </a>
        </td>
        <td>
            <a data-id="{/$item['iDsId']/}" href="" class="view" title="查看">
                {/$item['sDsName']/}
            </a>
        </td>
        <td>{/$item['sHost']/}/{/$item['sPort']/}</td>
        <td>{/$item['sNameServiceKey']/}</td>
        <td>{/$item['sDbname']/}</td>
        <td>{/$item['sCharset']/}</td>
        <td>{/$item['sDriver']/}</td>
        <td title="{/$item['sResponser']/}">{/$item['sResponser']/}</td>
        <td>{/$item['sCreator']/}</td>
        <td>{/$item['iDsId']/}</td>
    </tr>

