<%@ page contentType="text/html; charset=utf-8" %>
<div class="modal fade" id="edit-widget-pool" style="display: block">
	<div class="modal-dialog ui-block window-popup edit-widget edit-widget-pool">
		<a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close">
			<svg class="olymp-close-icon"><use xlink:href="icons/icons.svg#olymp-close-icon"></use></svg>
		</a>

		<div class="ui-block-title">
			<h6 class="title">Edit My Poll</h6>
		</div>

		<div class="ui-block-content">
			<form class="form-group label-floating">
				<label class="control-label">Poll Question</label>
				<input class="form-control" placeholder="" type="text" value="If you had to choose, which actor do you prefer to be the next D">
			</form>
			<form class="form-group label-floating">
				<label class="control-label">Option 01</label>
				<input class="form-control" placeholder="" type="text" value="Thomas Bale">
			</form>
			<form class="form-group label-floating">
				<label class="control-label">Option 02</label>
				<input class="form-control" placeholder="" type="text" value="Ben Robertson">
			</form>
			<form class="form-group label-floating">
				<label class="control-label">Option 03</label>
				<input class="form-control" placeholder="" type="text" value="">
			</form>

			<a href="#" class="inline-items add-option">
				<svg class="olymp-plus-icon"><use xlink:href="icons/icons.svg#olymp-plus-icon"></use></svg>
				<span>Add Poll Option</span>
			</a>

			<div class="row">
				<div class="col-lg-6 col-sm-12">
					<a href="#" class="btn btn-secondary btn-md full-width">Delete Poll</a>
				</div>

				<div class="col-lg-6 col-sm-12">
					<a href="#" class="btn btn-primary btn-md full-width">Save all Changes</a>
				</div>
			</div>
		</div>

	</div>
</div>