

################################
#    Settings Customization    #
################################


## Sets the maximum allowed size of the client request body, specified in the
#  Content-Length request header field. If the size in a request exceeds the
#  configured value, a malformed HTTP message is returned to the client.
#  
#  Note: max_body_size is applied even in streaming mode.
#  Default: 536870912
c.ServerApp.max_body_size = 5368709120

## Gets or sets the maximum amount of memory, in bytes, that is allocated for use
#  by the buffer manager.
#  Default: 536870912
c.ServerApp.max_buffer_size = 5368709120



###
## refference: https://jupyter-notebook.readthedocs.io/en/v6.4.8/extending/savehooks.html
###

import io
import os
from jupyter_server.utils import to_api_path

_script_exporter = None

def script_post_save(model, os_path, contents_manager, **kwargs):
    """convert notebooks to Python script after save with nbconvert

    replaces 'jupyter notebook --script'
    """
    from nbconvert.exporters.script import ScriptExporter

    if model['type'] != 'notebook':
        return

    global _script_exporter

    if _script_exporter is None:
        _script_exporter = ScriptExporter(parent=contents_manager)

    log = contents_manager.log

    base, ext = os.path.splitext(os_path)
    script, resources = _script_exporter.from_filename(os_path)
    script_fname = base + resources.get('output_extension', '.txt')
    log.info("Saving script /%s", to_api_path(script_fname, contents_manager.root_dir))

    with io.open(script_fname, 'w', encoding='utf-8') as f:
        f.write(script)

c.FileContentsManager.post_save_hook = script_post_save


##
# referrence: https://nbconvert.readthedocs.io/en/6.5.0/nbconvert_library.html#Example
##

from traitlets import Integer
from nbconvert.preprocessors import Preprocessor
from datetime import datetime, timezone

class ISO8601DateTimeNow(Preprocessor):
    """This preprocessor makes the current time in ISO 8601 format available for use in templates"""

    def preprocess(self, nb, resources):
        iso_now = datetime.utcnow().replace(microsecond=0, tzinfo=timezone.utc).isoformat()
        self.log.info(f'ISO8601DateTimeNow now(): resources["iso8610_datetime_utcnow"] = {iso_now}')
        resources["iso8610_datetime_utcnow"] = iso_now
        return nb, resources

c.HTMLExporter.preprocessors = [ISO8601DateTimeNow]

